clear all;
close all;
load('plasma_bubble_2016032007_ions.mat');
load('vik.mat');

nx=201;
ny=1;
nz=301;
hb=100;

plotfig=1;
figure(plotfig); 
figure(plotfig+1);
figure(plotfig+2);
figure(plotfig+3);%NO+
figure(plotfig+4);%O2+
figure(plotfig+5);%potential
figindex=1;
itindex=1;
showtime=[1249.5 1552.81 1583.14 1596.58 1610.71 1645.16 1754.70 1832.82 ];
for i=1:length(showtime)
    
    phy_tmp=reshape(simulation_data.phy(i,:,:),nx,nz);
    NE_tmp=reshape(simulation_data.Ne(i,:,:),nx,nz);
    hp_tmp=reshape(simulation_data.hp(i,:,:),nx,nz);
    op_tmp=reshape(simulation_data.op(i,:,:),nx,nz);
    nop_tmp=reshape(simulation_data.nop(i,:,:),nx,nz);
    o2p_tmp=reshape(simulation_data.o2p(i,:,:),nx,nz);
    hep_tmp=reshape(simulation_data.hep(i,:,:),nx,nz);
    n2p_tmp=reshape(simulation_data.n2p(i,:,:),nx,nz);
    np_tmp=reshape(simulation_data.np(i,:,:),nx,nz);
    datatmp_dt=simulation_data.dt(i);

%     figure;
    strtitle=sprintf('t=%0.2fs',datatmp_dt(1)-20000);
    figure(plotfig);
    subplot(2,4,figindex);

    datatmp=reshape(NE_tmp(:,:),nx,nz);
      
    contourf((0:nx-1)*2,hb+(0:nz-1)*2,log10(datatmp'),'LevelStep',0.1,'LineStyle','none');
    colormap(vik);

    caxis([3.0 6.0]);
    axis([0 (nx-1)*2 hb hb+(nz-1)*2]);
    title(strtitle);

    set(gca,'FontName','Helvetica', 'FontSize',14,'fontweight','bold' );
   if figindex==1 || figindex==5
        ylabel('Altitude (km)','FontSize',14,'fontweight','bold');
    end
   if figindex==6 || figindex==5|| figindex==7|| figindex==8
        xlabel('Zonal distance (km)','FontSize',14,'fontweight','bold');
   end
    
  if figindex==4 || figindex==8
      colorbar; 
   end
    

    figure(plotfig+1)
    subplot(2,4,figindex);
    xindex=100;
    ep=[hp_tmp(xindex,:)+op_tmp(xindex,:)+nop_tmp(xindex,:)+o2p_tmp(xindex,:)+hep_tmp(xindex,:)+n2p_tmp(xindex,:)+np_tmp(xindex,:)];
    ionp=[hp_tmp(xindex,:);op_tmp(xindex,:);nop_tmp(xindex,:);o2p_tmp(xindex,:);hep_tmp(xindex,:);n2p_tmp(xindex,:);np_tmp(xindex,:);ep];
    lcolor = colormap(jet(8));
    for pindex=1:8
        plot(log10(ionp(pindex,:)),hb+(0:nz-1)*2,'linewidth',2,'color',lcolor(pindex,:));hold on;
    end
    
    axis([0 10 hb hb+(nz-1)*2]);
    legend('h^+','o^+','no^+','o_2^+','he^+','n_2^+','n^+','e');
    title(strtitle);
    set(gca,'FontName','Helvetica', 'FontSize',14,'fontweight','bold' );
    ylabel('Altitude (km)','FontSize',14,'fontweight','bold');
    xlabel('Density (Log10(N(cm^-^3)))','FontSize',14,'fontweight','bold');

    
    figure(plotfig+2);
    subplot(2,4,figindex);
    yindex=100;
    ep=[hp_tmp(:,yindex)+op_tmp(:,yindex)+nop_tmp(:,yindex)+o2p_tmp(:,yindex)+hep_tmp(:,yindex)+n2p_tmp(:,yindex)+np_tmp(:,yindex)];
    ionp=[hp_tmp(:,yindex) op_tmp(:,yindex) nop_tmp(:,yindex) o2p_tmp(:,yindex) hep_tmp(:,yindex) n2p_tmp(:,yindex) np_tmp(:,yindex) ep];
    lcolor = colormap(jet(8));
    for pindex=1:8
        plot(0+(0:nx-1)*2,log10(ionp(:,pindex)),'linewidth',2,'color',lcolor(pindex,:));hold on;
    end
    hold off;
    axis([0 400 0 6]);
    legend('h^+','o^+','no^+','o_2^+','he^+','n_2^+','n^+','e');
    title(strtitle);
    set(gca,'FontName','Helvetica', 'FontSize',14,'fontweight','bold' );
    xlabel('Zonal distance (km)','FontSize',14,'fontweight','bold');
    ylabel('Density (Log10(N(cm^-^3)))','FontSize',14,'fontweight','bold');
    
     figure(plotfig+3);%NO+
    subplot(2,4,figindex);
    datatmp=reshape(nop_tmp(:,:),nx,nz);
    contourf((0:nx-1)*2,hb+(0:nz-1)*2,log10(datatmp'),'LevelStep',0.1,'LineStyle','none');
    colormap(vik);

    caxis([0.0 4.0]);
    axis([0 (nx-1)*2 hb hb+(nz-1)*2]);
    title(strtitle);

    if figindex==1 || figindex==5
        ylabel('Altitude (km)','FontSize',14,'fontweight','bold');
    end
   if figindex==6 || figindex==5|| figindex==7|| figindex==8
        xlabel('Zonal distance (km)','FontSize',14,'fontweight','bold');
   end
    
  if figindex==4 || figindex==8
      colorbar; 
  end
    set(gca,'FontName','Helvetica', 'FontSize',14,'fontweight','bold' );

    figure(plotfig+4);%NO+
    subplot(2,4,figindex);
    datatmp=reshape(o2p_tmp(:,:),nx,nz);
    contourf((0:nx-1)*2,hb+(0:nz-1)*2,log10(datatmp'),'LevelStep',0.1,'LineStyle','none');
    colormap(vik);
    caxis([-1.0 3.0]);
    axis([0 (nx-1)*2 hb hb+(nz-1)*2]);
    title(strtitle);

   if figindex==1 || figindex==5
        ylabel('Altitude (km)','FontSize',14,'fontweight','bold');
    end
   if figindex==6 || figindex==5|| figindex==7|| figindex==8
        xlabel('Zonal distance (km)','FontSize',14,'fontweight','bold');
   end
    
  if figindex==4 || figindex==8
      colorbar; 
  end
    set(gca,'FontName','Helvetica', 'FontSize',14,'fontweight','bold' );
    
    figure(plotfig+5);%%potential
    subplot(2,4,figindex);
    datatmp=reshape(phy_tmp(:,:),nx,nz);
    contourf((0:nx-1)*2,hb+(0:nz-1)*2,(datatmp'),'LevelStep',50,'LineWidth',0.1);
    %contourf((0:nx-1)*2,hb+(0:nz-1)*2,(datatmp'),'LevelStep',20,'LineWidth',0.1);
    colormap(vik);
    caxis([-400 400]);
    axis([0 (nx-1)*2 hb hb+(nz-1)*2]);
    title(strtitle);

   if figindex==1 || figindex==5
        ylabel('Altitude (km)','FontSize',14,'fontweight','bold');
    end
   if figindex==6 || figindex==5|| figindex==7|| figindex==8
        xlabel('Zonal distance (km)','FontSize',14,'fontweight','bold');
   end
    
  if figindex==4 || figindex==8
      colorbar; 
  end
  set(gca,'FontName','Helvetica', 'FontSize',14,'fontweight','bold' );
    
   figindex=figindex+1;

    pause(1);
    
end
